# cormas-vision-server

``` st
Metacello new
    baseline: 'CormasVisionServer';
    repository: 'github://kybeka/cormas-vision-server:main';
    onConflict: [ :e | e useIncoming ];
    onUpgrade: [ :e | e useIncoming ];
    onWarning: [ :e | e load ];
    ignoreImage;
    load
```
