function [durations, pitches] = wtc_book1_prelude_in_c()
    durations = [...
        1/2, 1/2 - 1/16, 1/16, 1/16, 1/16, 1/16, 1/16, 1/16];
    durations = [repmat(durations, 1, 31),...
        1, 1 - 1/16, 1/16*ones(1, 14), ...
        1, 1 - 1/16, 1/16*ones(1, 14), ...
        1, 1-1/16, 1-2/16, 1-3/16, 1-4/16];



    pitches = {...
        'C5', 'E5', 'G5', 'C6', 'E6', 'G5', 'C6', 'E6', ...
        'C5', 'E5', 'G5', 'C6', 'E6', 'G5', 'C6', 'E6', ...
        'C5', 'D5', 'A5', 'D6', 'F6', 'A5', 'D6', 'F6', ...
        'C5', 'D5', 'A5', 'D6', 'F6', 'A5', 'D6', 'F6', ...
        'B4', 'D5', 'G5', 'D6', 'F6', 'G5', 'D6', 'F6', ...
        'B4', 'D5', 'G5', 'D6', 'F6', 'G5', 'D6', 'F6', ...
        'C5', 'E5', 'G5', 'C6', 'E6', 'G5', 'C6', 'E6', ...
        'C5', 'E5', 'G5', 'C6', 'E6', 'G5', 'C6', 'E6', ...
        'C5', 'E5', 'A5', 'E6', 'A6', 'A5', 'E6', 'A6', ...
        'C5', 'E5', 'A5', 'E6', 'A6', 'A5', 'E6', 'A6', ...
        'C5', 'D5', 'F#5', 'A5', 'D6', 'F#5', 'A5', 'D6', ...
        'C5', 'D5', 'F#5', 'A5', 'D6', 'F#5', 'A5', 'D6', ...
        'B4', 'D5', 'G5', 'D6', 'G6', 'G5', 'D6', 'G6', ...
        'B4', 'D5', 'G5', 'D6', 'G6', 'G5', 'D6', 'G6', ...
        'B4', 'C5', 'E5', 'G5', 'C6', 'E5', 'G5', 'C6', ...
        'B4', 'C5', 'E5', 'G5', 'C6', 'E5', 'G5', 'C6', ...
        'A4', 'C5', 'E5', 'G5', 'C6', 'E5', 'G5', 'C6', ...
        'A4', 'C5', 'E5', 'G5', 'C6', 'E5', 'G5', 'C6', ...
        'D4', 'A4', 'D5', 'F#5', 'C6', 'D5', 'F#5', 'C6', ...
        'D4', 'A4', 'D5', 'F#5', 'C6', 'D5', 'F#5', 'C6', ...
        'G4', 'B4', 'D5', 'G5', 'B5', 'D5', 'G5', 'B5',  ...
        'G4', 'B4', 'D5', 'G5', 'B5', 'D5', 'G5', 'B5',  ...
        'G4', 'Bb4', 'E5', 'G5', 'C#6', 'E5', 'G5', 'C#6',  ...
        'G4', 'Bb4', 'E5', 'G5', 'C#6', 'E5', 'G5', 'C#6',  ...
        'F4', 'A4', 'D5', 'A5', 'D6', 'D5', 'A5', 'D6',  ...
        'F4', 'A4', 'D5', 'A5', 'D6', 'D5', 'A5', 'D6',  ...
        'F4', 'Ab4', 'D5', 'F5', 'B5', 'D5', 'F5', 'B5',  ...
        'F4', 'Ab4', 'D5', 'F5', 'B5', 'D5', 'F5', 'B5',  ...
        'E4', 'G4', 'C5', 'G5', 'C6', 'C5', 'G5', 'C6',  ...
        'E4', 'G4', 'C5', 'G5', 'C6', 'C5', 'G5', 'C6',  ...
        'E4', 'F4', 'A4', 'C5', 'F5', 'A4', 'C5', 'F5',  ...
        'E4', 'F4', 'A4', 'C5', 'F5', 'A4', 'C5', 'F5',  ...
        'D4', 'F4', 'A4', 'C5', 'F5', 'A4', 'C5', 'F5',  ...
        'D4', 'F4', 'A4', 'C5', 'F5', 'A4', 'C5', 'F5',  ...
        'G3', 'D4', 'G4', 'B4', 'F5', 'G4', 'B4', 'F5',  ...
        'G3', 'D4', 'G4', 'B4', 'F5', 'G4', 'B4', 'F5',  ...
        'C4', 'E4', 'G4', 'C5', 'E5', 'G4', 'C5', 'E5', ...
        'C4', 'E4', 'G4', 'C5', 'E5', 'G4', 'C5', 'E5', ...
        'C4', 'G4', 'Bb4', 'C5', 'E5', 'Bb4', 'C5', 'E5',  ...
        'C4', 'G4', 'Bb4', 'C5', 'E5', 'Bb4', 'C5', 'E5',  ...
        'F3', 'F4', 'A4', 'C5', 'E5', 'A4', 'C5', 'E5',  ...
        'F3', 'F4', 'A4', 'C5', 'E5', 'A4', 'C5', 'E5',  ...
        'F#3', 'C4', 'A4', 'C5', 'Eb5', 'A4', 'C5', 'Eb5',  ...
        'F#3', 'C4', 'A4', 'C5', 'Eb5', 'A4', 'C5', 'Eb5',  ...
        'Ab3', 'F4', 'B4', 'C5', 'D5', 'B4', 'C5', 'D5',  ...
        'Ab3', 'F4', 'B4', 'C5', 'D5', 'B4', 'C5', 'D5',  ...
        'G3', 'F4', 'G4', 'B4', 'D5', 'G4', 'B4', 'D5',  ...
        'G3', 'F4', 'G4', 'B4', 'D5', 'G4', 'B4', 'D5',  ...
        'G3', 'E4', 'G4', 'C5', 'E5', 'G4', 'C5', 'E5',  ...
        'G3', 'E4', 'G4', 'C5', 'E5', 'G4', 'C5', 'E5',  ...
        'G3', 'D4', 'G4', 'C5', 'F5', 'G4', 'C5', 'F5',  ...
        'G3', 'D4', 'G4', 'C5', 'F5', 'G4', 'C5', 'F5',  ...
        'G3', 'D4', 'G4', 'B4', 'F5', 'G4', 'B4', 'F5',  ...
        'G3', 'D4', 'G4', 'B4', 'F5', 'G4', 'B4', 'F5',  ...
        'G3', 'Eb4', 'A4', 'C5', 'F#5', 'A4', 'C5', 'F#5',  ...
        'G3', 'Eb4', 'A4', 'C5', 'F#5', 'A4', 'C5', 'F#5',  ...
        'G3', 'E4', 'G4', 'C5', 'G5', 'G4', 'C5', 'G5',  ...
        'G3', 'E4', 'G4', 'C5', 'G5', 'G4', 'C5', 'G5',  ...
        'G3', 'D4', 'G4', 'C5', 'F5', 'G4', 'C5', 'F5',  ...
        'G3', 'D4', 'G4', 'C5', 'F5', 'G4', 'C5', 'F5',  ...
        'G3', 'D4', 'G4', 'B4', 'F5', 'G4', 'B4', 'F5',  ...
        'G3', 'D4', 'G4', 'B4', 'F5', 'G4', 'B4', 'F5',  ...
        'C3', 'C4', 'G4', 'Bb4', 'E5', 'G4', 'Bb4', 'E5',  ...
        'C3', 'C4', 'G4', 'Bb4', 'E5', 'G4', 'Bb4', 'E5',  ...
        'C3', 'C4', 'F4', 'A4', 'C5', 'F5', 'C5', 'A4',  'C5', 'A4', 'F4', 'A4', 'F4', 'D4', 'F4', 'D4', ...
        'C3', 'B3', 'G5', 'B5', 'D6', 'F6', 'D6', 'B5', 'D6', 'B5', 'G5', 'B5', 'D5', 'F5', 'E5', 'D5', ...
        'C3', 'C4', 'E4', 'G4', 'C5', ...
        };
end

