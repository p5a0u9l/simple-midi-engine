classdef Bar < handle
    properties
        notes
        duration       % length, in seconds of a single bar
        data
        n_samp
        sample_rate
    end

    methods
        function me = init(me, piece)
            me.duration = 60/piece.tempo*4;
            me.sample_rate = piece.sample_rate;
            me.data = zeros(1, me.duration*piece.sample_rate);
            me.n_samp = length(me.data);
            me.notes = [];
        end

        function me = append(me, note, offset)
            me.notes = [me.notes; note];
            i0 = floor(me.duration*offset*me.sample_rate);
            me.data((1:note.n_samp) + i0) = me.data((1:note.n_samp) + i0) + note.data;
        end
    end
end


