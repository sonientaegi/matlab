function [ T ] = periods2( data, Fs, Tmax )
Fc_low  = 128;
Fc_high = 10000;
Mfilter = 501;

% 1. data 를 Fc_low - Fc_hi BandStop 필터를 통과시켜 베이스드럼과 스네어드럼을 추출한다.
wc_low  = 2*pi/Fs*Fc_low;
wc_high = 2*pi/Fs*Fc_high;
h_hp    = ideal_lp(pi, Mfilter) - ideal_lp(wc_high, Mfilter);
h_lp    = ideal_lp(wc_low, Mfilter);
h_bs    = h_lp + h_hp;
w       = blackman(Mfilter)';
hpf     = w .* h_hp;
lpf     = w .* h_lp;
bsf     = w .* h_bs;

% src     = conv(data, hpf);
% src     = conv(data, bsf);
src     = conv(data, lpf);
src     = src(1:length(data));

% 2. power 를 구한다.
src     = src .* src;

% 3. 반복적으로 주기를 구한다.
T       = zeros(1, length(data));
Tprev   = 0;
Mprev   = 0;
iprev   = 1;

index   = 1;
MT_max  = ceil(Tmax*2*Fs);
while index <= (length(data)-MT_max)
    isHit   = false;
    isEdge  = false;
    
    if Tprev > 0 
        % 직전 주기 데이터와 지금 주기 데이터 컨벌루션. -5 ~ 5ms 오차 한도 인정 
        offsetMax   = 0;
        offsetCoef  = 0;
        for offset = round([-5:5]*Fs*0.001)
            coef = sum(src([iprev:iprev+Mprev-1]) .* (src([index:index+Mprev-1] + offset)));
            if coef > offsetCoef
                offsetCoef = coef;
                offsetMax  = offset;
            end
        end

        if 2*coef > sum(src([iprev:iprev+Mprev-1]) .* src([iprev:iprev+Mprev-1])) 
            % 주기성 유지 확인
            isHit = true;
            if offsetMax > 0
                T(index:index+offsetMax-1) = Tprev;
                index = index+offsetMax;
            end
        else
            % 주기 변경 됨
            isEdge = true;
        end
    end
    
    if isHit 
        % 주기성이 유지되고 있는 경우 직전 주기를 그대로 사용한다.
        Tnext = Tprev;
    else 
        % 아니면 자기주기 확인
        Tnext = period(src(index:index+MT_max-1), Fs);
    end
    
    % 주기성을검증하고, 리듬을 확정한다. 
    if Tnext < 0.5
        % 주기 획득 실패 시 10ms 뒤재시작
        Tnext = 0;
        Mnext = 0.01 * Fs;
    else 
        Mnext = Tnext * Fs;
    end
    Mnext = round(Mnext);
        
    
    % 주기성을 저장한다.
    T(index:index+Mnext-1) = Tnext;
    
    % 테스트 용 마커를 찍자.
    if isHit
        T(index) = 0.1;     % Marker - Next block
    else
        T(index) = 0;       % Marger - This is new block
    end
    
    if isEdge
        T(index+ceil(Mnext/2)-1) = Tnext+0.5;
    end
    
    % 주기가 유지되는 경우 주기 정보를 백업한다.
    Tprev = Tnext;
    Mprev = Mnext;
    iprev = index;
    
    % 다음 차례 준비 
    index = index + Mnext;
end