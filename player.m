% init the Piece object
bpm = 200;
fs = 44.1e3;
p = Piece().init(bpm, fs);

pitches = wtc_book1_prelude_in_c();
scale = readtable('scale_freqs.csv', 'ReadRowNames', 1);

% generate and append notes to Piece
for i = 1:length(pitches)
    f0 = scale{pitches{i}, 'Frequency_Hz'};
    p.append(Note().init(f0, 1/8));
end

% compile notes into continuous waveform
p.compile();

% play the piece
p.play()

