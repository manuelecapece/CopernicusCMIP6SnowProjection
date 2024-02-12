function eliminaDataset(isInApp, path1, path2)
% Ripulisce la cartella dataset dai dataset scaricati con le richieste

if (~isInApp)
    cd('dataset\');
else
    cd(path1);
end

currentDirectory = pwd;

subfolders = dir(currentDirectory); % Ottieni la lista delle cartelle nella cartella specificata

% Itera attraverso tutte le cartelle (escludendo . e ..)
for i = 1:numel(subfolders)
    if subfolders(i).isdir && ~strcmp(subfolders(i).name, '.') && ~strcmp(subfolders(i).name, '..')
        subfolderPath = fullfile(currentDirectory, subfolders(i).name);
        % Elimina la cartella e tutti i suoi contenuti (file e sottocartelle)
        rmdir(subfolderPath, 's');
    elseif ~subfolders(i).isdir
        % Se non è una cartella, ma un file, elimina direttamente il file
        filePath = fullfile(currentDirectory, subfolders(i).name);
        delete(filePath); % Elimina il file
    end
end

if (~isInApp)
    cd('..\');
else
    cd(path2);
end

end
