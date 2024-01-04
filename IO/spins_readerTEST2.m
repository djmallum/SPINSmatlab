cd /scratch/dallum/3D_corner_4x
fname = 't.0';
Ny = 2048;
Nz = 512;
Nx = 2048;
ranges{1} = 1:Ny;
ranges{2} = 1:Nz;
ranges{3} = 1:Nx;
parpool
for ii=1:100
% memmap the file for reading
m = memmapfile(fname, 'Offset', 0, ...
    'Format', {'double' [Ny, Nz, Nx] 'x'}, ...
    'Writable', false);

% Get the file size using dir function

% Determine the number of available workers
poolobj = gcp('nocreate'); % If no pool, do not create a new one.
if isempty(poolobj)
    poolsize = 0;
else
    poolsize = poolobj.NumWorkers
end

% Calculate the chunk size based on the number of workers and along the third dimension
chunkSizeElements = ceil(length(ranges{3}) / poolsize); %chunkSizeBytes / 8 % Convert to the number of double elements

% Calculate the number of chunks along the third dimension (Nx)
numChunksX = poolsize;

% Parallelize the data extraction using parfor
parfor iChunkX = 1:numChunksX
    % Calculate the start and end indices for the current chunk along the third dimension (Nx)
    startIdxX = (iChunkX - 1) * chunkSizeElements + 1;
    endIdxX = min(iChunkX * chunkSizeElements, Nx);
    
    % Extract the data for the current chunk and store it in a temporary array
    partialResults{iChunkX} = m.Data.x(ranges{1}, ranges{2}, ranges{3}(startIdxX:endIdxX));
end

% Concatenate the partial results along the third dimension to obtain the final result
result = cat(3, partialResults{:});
toc
clear result partialResults
end
toc
% The extracted data is now stored in the 'result' variable

