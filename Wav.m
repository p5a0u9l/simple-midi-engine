classdef Wav
    methods(Static)
        function y = tri(wt)
            n_halfcycle = F.arg(@min, abs(wt - pi));
            t = triang(n_halfcycle);
            t = [t; -t]';
            n_t = floor(length(wt)/length(t));
            y = repmat(t, 1, n_t);
            n_miss = length(wt) - length(y);
            y = [y, t(1:n_miss)];
        end

        function y = cos_sin(wt)
            y = cos(wt).*sin(wt);
        end

        function y = abs_sin(wt)
            y = abs(sin(wt));
        end

        function y = sin(wt)
            y = sin(wt);
        end
    end
end
