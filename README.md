# tutorial-websphere
Questo è un semplice tutorial per dimostrare come sia semplice utilizzando Docker e l'immagine di [Websphere Application Server](https://www.ibm.com/support/knowledgecenter/en/SSAW57_8.5.5/com.ibm.websphere.nd.multiplatform.doc/ae/welc6productov.html) 8.5.5.13 fornita da IBM, creare un container che esegua un'applicazione JavaEE.
Nello specifico è stata utilizzata l'applicazione di esempio **JSF 2.0 samples** fornita da IBM stessa.


## Descrizione
In questo progetto vedremo all'opera un dockerfile con doppia clausola **FROM**.
Nella prima clausola, viene invocata un'immagine docker che permette di generare un file *jython* a partire da un file *json* di configurazione.
Con tale file *jython*, a partire dalla seconda clausola **FROM** si configurerà opportunamente la nostra immagine custom di WebSphere contenente l'applicazione deployata.

## Build dell'immagine
Per effettuare la build dell'immagine è sufficiente invocare il comando

```bash
docker build -t websphere .
```
## Creazione del container
Per instanziare il container eseguiamo il comando

```bash
docker run --name was -p9060:9060 -p9080:9080 -p8880:8880 -d websphere
```
## Indirizzi
La console amministrativa è senza sicurezza (accesso libero) ed è disponibile all'indirizzo http://localhost:9060/ibm/console/ .

L'applicazione risponde all'indirizzo http://localhost:9080/SampleAjax/index.faces .