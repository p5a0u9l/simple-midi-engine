classdef Note < handle
    properties
        pitch       % frequency in Hz
        value       % length, fraction of bar, 1/4, 1/2, etc
        data
        n_samp
    end

    methods
        function me = init(me, pitch, value)
            me.pitch = pitch;
            me.value = value;
        end


        function me = create(me, piece)
            duration = 60/piece.tempo*4*me.value;
            N = round(duration*piece.sample_rate);
            t = (0:N - 1)/piece.sample_rate;
            me.data = piece.f_wav(2*pi*me.pitch*t);
            me.n_samp = N;
        end

        function me = window(me, t)
            nt = length(t);
            N = me.n_samp;
            me.data = [...
                me.data(1:nt).*t, ...
                me.data(nt+1:N - nt), ...
                me.data(N - nt+1:N).*fliplr(t)];
        end

    end
end

