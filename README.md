# EZTeleport
fivem mod highly configurable to teleport players

## Français
EZTeleport est un mod pour FiveM permettant aux administrateurs de créer des points de téléportation personnalisés sur leurs serveurs. Ce mod est hautement configurable et peut être adapté à différents frameworks comme ESX ou OX.

### Configuration
Modifiez le fichier `Config.lua` pour ajuster les paramètres suivants :
- `LogsActive` : Activez ou désactivez la journalisation des téléportations.
- `DiscordWebhook` : URL du webhook Discord pour envoyer les logs.
- `EmbedColor` : Couleur de l'embed Discord en décimal.
- `Framework` : Indiquez si vous utilisez 'esx' ou 'ox'.
- `Defaults` et `Teleports` : Définissez les points de téléportation, leur visibilité, les items requis, et les métiers autorisés.

### Installation
1. Téléchargez et placez le mod dans votre dossier `resources`.
2. Ajoutez `ensure EZTeleport` à votre fichier `server.cfg`.
3. Configurez le fichier `Config.lua` selon vos besoins.

### Patch Note v1.1.0

1. **Amélioration de la gestion des erreurs :**
    - Ajout de vérifications pour s'assurer que tous les champs obligatoires (`nom`, `tpPos`, `Destination`) sont présents.
    - Les erreurs de configuration sont enregistrées dans la console du serveur et localisées en fonction de la langue configurée.
    - Les messages d'erreur incluent maintenant des descriptions claires et localisées, aidant les utilisateurs à identifier et résoudre les problèmes de configuration.

2. **Localisation améliorée :**
    - Ajout de fichiers de langue pour les messages en français, en anglais et en italien.
    - Les logs Discord et les messages d'erreur serveur sont maintenant localisés.
    - Tous les messages de téléportation et d'erreur sont définis dans `locales.lua`, permettant une traduction facile dans d'autres langues.

3. **Refactorisation du script serveur (`sv_main.lua`) :**
    - Utilisation de variables locales pour simplifier le code et éviter les erreurs de concaténation.
    - Amélioration de la logique de vérification des téléportations pour s'assurer que les joueurs remplissent les conditions requises avant de se téléporter.
    - Simplification des messages envoyés au client pour afficher les notifications de téléportation réussie ou d'accès refusé.

4. **Modification de `sv_version_check.lua` :**
    - La vérification de la version se fait maintenant une seule fois au démarrage du mod, au lieu de tourner toutes les 5 secondes.
    - Les messages de vérification de version sont affichés dans la console pour indiquer si l'utilisateur utilise la dernière version ou s'il existe une nouvelle version disponible.

## English
EZTeleport is a FiveM mod that allows administrators to create customized teleportation points on their servers. This mod is highly configurable and can be adapted for different frameworks like ESX or OX.

### Configuration
Edit the `Config.lua` file to adjust the following settings:
- `LogsActive`: Enable or disable logging of teleportations.
- `DiscordWebhook`: Discord webhook URL to send logs.
- `EmbedColor`: Decimal color of the Discord embed.
- `Framework`: Specify whether you are using 'esx' or 'ox'.
- `Defaults` and `Teleports`: Define the teleportation points, their visibility, required items, and authorized jobs.

### Installation
1. Download and place the mod in your `resources` folder.
2. Add `ensure EZTeleport` to your `server.cfg`.
3. Configure the `Config.lua` file as needed.

### Patch Note v1.1.0

1. **Improved error handling:**
    - Added checks to ensure all mandatory fields (`nom`, `tpPos`, `Destination`) are present.
    - Configuration errors are logged to the server console and localized based on the configured language.
    - Error messages now include clear and localized descriptions to help users identify and fix configuration issues.

2. **Enhanced localization:**
    - Added language files for messages in French, English, and Italian.
    - Discord logs and server error messages are now localized.
    - All teleportation and error messages are defined in `locales.lua`, making it easy to translate into other languages.

3. **Refactored server script (`sv_main.lua`):**
    - Used local variables to simplify the code and avoid concatenation errors.
    - Improved teleportation verification logic to ensure players meet the required conditions before teleporting.
    - Simplified messages sent to the client to display successful teleportation or access denied notifications.

4. **Modification of `sv_version_check.lua`:**
    - Version checking now occurs once at mod startup instead of running every 5 seconds.
    - Version check messages are displayed in the console to indicate whether the user is using the latest version or if a new version is available.

## Italiano
EZTeleport è un mod per FiveM che permette agli amministratori di creare punti di teletrasporto personalizzati sui loro server. Questo mod è altamente configurabile e può essere adattato per diversi framework come ESX o OX.

### Configurazione
Modifica il file `Config.lua` per aggiustare le seguenti impostazioni:
- `LogsActive`: Attiva o disattiva la registrazione delle teleportazioni.
- `DiscordWebhook`: URL del webhook di Discord per inviare i log.
- `EmbedColor`: Colore dell'embed di Discord in decimale.
- `Framework`: Specifica se stai utilizzando 'esx' o 'ox'.
- `Defaults` e `Teleports`: Definisci i punti di teletrasporto, la loro visibilità, gli oggetti richiesti e i lavori autorizzati.

### Installazione
1. Scarica e posiziona il mod nella tua cartella `resources`.
2. Aggiungi `ensure EZTeleport` al tuo file `server.cfg`.
3. Configura il file `Config.lua` secondo le tue necessità.

### Patch Note v1.1.0

1. **Gestione degli errori migliorata:**
    - Aggiunti controlli per garantire che tutti i campi obbligatori (`nom`, `tpPos`, `Destination`) siano presenti.
    - Gli errori di configurazione vengono registrati nella console del server e localizzati in base alla lingua configurata.
    - I messaggi di errore ora includono descrizioni chiare e localizzate per aiutare gli utenti a identificare e risolvere i problemi di configurazione.

2. **Localizzazione migliorata:**
    - Aggiunti file di lingua per i messaggi in francese, inglese e italiano.
    - I log di Discord e i messaggi di errore del server sono ora localizzati.
    - Tutti i messaggi di teletrasporto ed errore sono definiti in `locales.lua`, facilitando la traduzione in altre lingue.

3. **Script server (`sv_main.lua`) rifattorizzato:**
    - Utilizzate variabili locali per semplificare il codice ed evitare errori di concatenazione.
    - Logica di verifica del teletrasporto migliorata per garantire che i giocatori soddisfino le condizioni richieste prima di teletrasportarsi.
    - Messaggi semplificati inviati al client per visualizzare notifiche di teletrasporto riuscito o accesso negato.

4. **Modifica di `sv_version_check.lua`:**
    - Il controllo della versione ora avviene una volta all'avvio del mod invece di essere eseguito ogni 5 secondi.
    - I messaggi di controllo della versione vengono visualizzati nella console per indicare se l'utente sta utilizzando l'ultima versione o se è disponibile una nuova versione.
