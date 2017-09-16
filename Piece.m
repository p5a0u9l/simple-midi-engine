classdef Piece < handle
    properties
        tempo
        sample_rate
        bars
        audio
        player          % audio player
    end

    properties(Hidden)
        rise               % value of rise/fall rise
        wav_function       % function handle defining waveform
        decay_function       % function handle defining waveform
    end

    methods
        function me = init(me, tempo, fs, tau, wave)
            me.tempo = tempo;
            me.sample_rate = fs;
            me.wav_function = wave;
            me.decay_function = @(t) exp(tau*t);

            rise_length = 0.025;
            n_rise = round(rise_length*me.sample_rate);
            a = hanning(2*n_rise)';
            me.rise = a(1:n_rise);

            me.bars = [];
        end

        function me = append(me, bar0)
            me.bars = [me.bars; bar0];
        end

        function me = compile(me)
            n_total = sum([me.bars.n_samp]);
            me.audio = zeros(1, n_total);
            offset = 0;
            for i = 1:length(me.bars)
                me.audio((1:me.bars(i).n_samp) + offset) = me.bars(i).data;
                offset = offset + me.bars(i).n_samp;
            end
            me.player = audioplayer(me.audio, me.sample_rate, 16);
        end

        function me = play(me, block)
            if block == 1
                me.player.playblocking()
            else
                me.player.play()
            end
        end
    end
end

