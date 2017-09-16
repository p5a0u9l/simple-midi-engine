classdef F
    % a static class to encapsulate small functions
    %
    methods(Static)  % MATH
        function y = arg(func, x)
            [~, y] = func(x);
        end

        function y = complex2dB(z)
            y = 10*log10(F.complex2pow(z) + eps);
        end

        function y = complex2pow(z)
            y = abs(z).^2;
        end
    end

    methods(Static)  % PLOT
        function add_line(orientation, position)
            ax = gca();
            N = 100;
            if strcmp(orientation, 'V')
                y = linspace(ax.YLim(1), ax.YLim(2), N);
                x = ones(1, N)*position;
            elseif strcmp(orientation, 'H')
                x = linspace(ax.XLim(1), ax.XLim(2), N);
                y = ones(1, N)*position;
            end
            plot(x, y, 'w--');
        end

        function f = new_docked_fig()
            f = figure();
            f.WindowStyle = 'docked';
        end
    end
end
