# Progetto MTOT

Repository del progetto di Metodi e Tecniche per l'osservazione della terra, edizione 2023-2024, gruppo 2, Università degli Studi della Basilicata, laurea magistrale in Ingegneria informatica e delle tecnologie dell'informazione.

## Installazione

Per poter utilizzare l'applicativo è necessario che siano rispettati TUTTI i seguenti punti:

- Sulla macchina vi deve essere installata una versione di MATLAB pari o superiore alla R2020a
- In MATLAB vi deve essere installato il [Climate Data Store Toolbox for MATLAB](https://it.mathworks.com/matlabcentral/fileexchange/104550-climate-data-store-toolbox-for-matlab) utilizzando l'Add-on Explorer di MATLAB o scaricandolo dalla pagina [GitHub](https://github.com/mathworks/climatedatastore)
- Sulla macchina vi deve essere installato [Python](https://www.python.org/downloads/) in una [versione compatibile con la propria versione di MATLAB](https://it.mathworks.com/support/requirements/python-compatibility.html) e deve essere visibile a MATLAB. È possibile controllare quest'ultimo punto tramite il comando ```pyenv```.
- Sulla macchina vi deve essere installata tramite ```pip``` [l'API CDS per Python](https://github.com/ecmwf/cdsapi)

Una volta terminata la fase di configurazione iniziale è possibile aprire il file ```CMIP6 Climate Projections Visualizer.mlappinstall``` presente nella cartella ```/dist``` e esso si installerà come un Add-on di MATLAB ovvero una MATLAB App. Una volta terminata la breve installazione l'applicativo si troverà in MATLAB nella sezione ```APPS->MY APPS```.

## Uso

Il toolbox sulla cui base è stato costruito l'applicativo richiederà per la prima volta le credenziali CSAPI. È possibile visitare [How to use the CDS API](https://cds.climate.copernicus.eu/api-how-to) per ulteriori informazioni.

## Screen dell'app
Content screen
![](https://github.com/manuelecapece/CopernicusCMIP6SnowProjection/blob/main/dist/screenApp.png)

Esempio di risultato
![](https://github.com/manuelecapece/CopernicusCMIP6SnowProjection/blob/main/dist/SpessoreNeve.png)


## Licenza

[MIT](https://choosealicense.com/licenses/mit/)

