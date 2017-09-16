classdef Wav
    methods(Static)
        function y = rect(wt)
            a = sin(wt);
            y = zeros(size(a));
            y(a > 0) = 1;
            y(a <= 0) = -1;
        end

        function y = saw(wt)
            y = zeros(1, length(wt));
            n_cycle = F.arg(@min, abs(wt - 2*pi));
            n_rev = floor(length(wt)/n_cycle);
            a = (1:n_cycle)/n_cycle - 1/2;
            n = length(a)*n_rev;
            y(1:n) = repmat(a, 1, n_rev);
            y(n+1:length(wt)) = a(1:length(wt) - n);
        end

        function y = tri(wt)
            n_halfcycle = F.arg(@min, abs(wt - pi));
            t = triang(n_halfcycle);
            t = [t; -t]';
            n_t = floor(length(wt)/length(t));
            y = repmat(t, 1, n_t);
            n_miss = length(wt) - length(y);
            y = [y, t(1:n_miss)];
        end

        function y = sin_rect(wt)
            y = Wav.rect(wt)/4 + 3*sin(wt)/4;
        end

        function y = sin_saw(wt)
            y = Wav.saw(wt)/4 + 3*sin(wt)/4;
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
