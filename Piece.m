classdef Piece < handle
    properties
        tempo
        sample_rate
        bars
        audio
    end

    properties(Hidden)
        f_wav       % function handle defining waveform
        taper     % value of rise/fall taper
    end

    methods
        function me = init(me, tempo, fs)
            me.tempo = tempo;
            me.sample_rate = fs;
            me.f_wav = @sin;

            taper_length = 0.025;
            n_taper = round(taper_length*me.sample_rate);
            a = hanning(2*n_taper)';
            me.taper = a(1:n_taper);

            me.bars = [];
        end

        function me = append(me, bar0)
            note.create(me).window(me.taper);
            me.bars = [me.bars; bar0];
        end

        function me = compile(me)
            n_total = sum([me.bars.n_samp]);
            me.audio = zeros(1, n_total);
            offset = 0;
            for i = 1:length(me.bars)
                me.audio((1:me.bars(i).n_samp) + offset) = me.notes(i).data;
                offset = offset + me.bars(i).n_samp;
            end
        end

        function me = play(me)
            sound(me.audio, me.sample_rate, 16);
        end
    end
end

