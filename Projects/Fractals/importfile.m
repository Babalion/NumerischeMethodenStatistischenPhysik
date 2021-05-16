function [maxSteps] = importfile(filename, dataLines)
%IMPORTFILE Import data from a text file
%  [MAXSTEPS, NUMBEROFITERATIONS, COMEBACKRATE] = IMPORTFILE(FILENAME)
%  reads data from text file FILENAME for the default selection.
%  Returns the data as column vectors.
%
%  [MAXSTEPS, NUMBEROFITERATIONS, COMEBACKRATE] = IMPORTFILE(FILE,
%  DATALINES) reads data for the specified row interval(s) of text file
%  FILENAME. Specify DATALINES as a positive scalar integer or a N-by-2
%  array of positive scalar integers for dis-contiguous row intervals.
%
%  Example:
%  [maxSteps, numberofiterations, comebackrate] = importfile("/home/chris/Dokumente/GitHub/NumerischeMethodenStatistischenPhysik/cmake-build-release/bin/euclidean3D.tsv", [2, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 15-May-2021 23:14:11

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [2, Inf];
end

%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 3);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = "\t";

% Specify column names and types
opts.VariableNames = ["maxSteps", "numberofiterations", "comebackrate"];
opts.VariableTypes = ["double", "double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Import the data
tbl = readtable(filename, opts);

%% Convert to output type
maxSteps = tbl.maxSteps;
numberofiterations = tbl.numberofiterations;
comebackrate = tbl.comebackrate;
end