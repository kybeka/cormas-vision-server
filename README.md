# cormas-vision-server



``` st
"Load Cormas"
Metacello new
    repository: 'github://cormas/cormas';
    baseline: 'Cormas';
    load.

"Load the Vision server"
Metacello new
    baseline: 'CormasVisionServer';
    repository: 'github://kybeka/cormas-vision-server:main';
    onConflict: [ :e | e useIncoming ];
    onUpgrade: [ :e | e useIncoming ];
    onWarning: [ :e | e load ];
    ignoreImage;
    load
```
