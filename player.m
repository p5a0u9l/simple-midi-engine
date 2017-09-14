% init the Piece object
bpm = 200;
fs = 44.1e3;
piece = Piece().init(bpm, fs);

[durations, pitches] = wtc_book1_prelude_in_c();
scale = readtable('scale_freqs.csv', 'ReadRowNames', 1);

n_note = length(pitches - 1);
notes_per_bar = 16;
n_bar = n_note/notes_per_bar;
note_offset = 1/16;

% generate and append notes to Piece
for i = 1:n_bar
    bar0 = Bar();
    for j = 1:notes_per_bar
        f0 = scale{pitches{(i - 1)*notes_per_bar + j}, 'Frequency_Hz'};
        n0 = Note().init(f0, durations(j)).create(piece).window(piece.taper);
        bar0.append(n0, j*offset);
    end
    piece.append(bar0);
end

% compile notes into continuous waveform
piece.compile();

% play the piece
piece.play()

