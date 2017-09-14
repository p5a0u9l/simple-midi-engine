% external data sources
[durations, pitches] = wtc_book1_prelude_in_c();
notes_per_bar = 16;
note_offset = 1/16;
time_constant = 3;
scalar = 1/4;
scale = readtable('frequencies_for_equal-tempered_scale.csv', 'ReadRowNames', 1);

% init the Piece object
bpm = 120;
fs = 44.1e3;
piece = Piece().init(bpm, fs, time_constant);

% constants
n_note = length(pitches);
n_bar = ceil(n_note/notes_per_bar);

% generate and append notes to bars and the bars to piece
for i = 1:n_bar
    bar0 = Bar().init(piece);
    i_bar0 = (i - 1)*notes_per_bar;

    if i == 35; notes_per_bar = 5; end

    for j = 1:notes_per_bar

        % init, create, and window the note
        index = i_bar0 + j;
        name0 = pitches{index};
        f0 = scale{name0, 'Frequency_Hz'};
        d0 = durations(j);
        n0 = Note()...
            .init(f0, d0, name0, scalar)...
            .create(piece)...
            .window(piece.taper);

        % append note to current bar
        bar0.append(n0, (j - 1)*note_offset);
    end

    % append bar to the piece
    piece.append(bar0);
end

% compile bars into continuous waveform
piece.compile();

% play the piece
piece.play()

