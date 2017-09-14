classdef Note < handle
    properties
        name
        scalar
        pitch       % frequency in Hz
        value       % length, fraction of bar, 1/4, 1/2, etc
        data
        n_samp
    end

    properties(Constant, Hidden)
        SEC_PER_MIN = 60;
        BEAT_PER_BAR = 4;
    end


    methods
        function me = init(me, pitch, value, name, scalar)
            me.scalar = scalar;
            me.pitch = pitch;
            me.value = value;
            me.name = name;
        end


        function me = create(me, piece)
            duration = me.SEC_PER_MIN/piece.tempo*me.BEAT_PER_BAR*me.value;
            N = round(duration*piece.sample_rate);
            t = (0:N - 1)/piece.sample_rate;
            me.data = me.scalar*piece.decay_function(t).*piece.wav_function(2*pi*me.pitch*t);
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

