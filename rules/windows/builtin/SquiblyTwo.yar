title: SquiblyTwo
status: experimental
description: Detects WMI SquiblyTwo Attack with possible renamed WMI by looking for imphash
references:
    - https://subt0x11.blogspot.ch/2018/04/wmicexe-whitelisting-bypass-hacking.html
    - https://twitter.com/mattifestation/status/986280382042595328
author: Markus Neis / Florian Roth
falsepositives:
    - Unknown
level: medium
logsource:
   product: windows
   service: sysmon
detection:
    selection1:
        EventID: 1
        Image:
            - '*\wmic.exe'
        CommandLine:
            - 'wmic * *format:\"http*'
            - "wmic * /format:'http"
            - 'wmic * /format:http*'
    selection2:
        EventID: 1
        Imphash:
             - '1B1A3F43BF37B5BFE60751F2EE2F326E'
             - '37777A96245A3C74EB217308F3546F4C'
             - '9D87C9D67CE724033C0B40CC4CA1B206'
        CommandLine:
            - '* *format:\"http*'
            - "* /format:'http"
            - '* /format:http*'
    condition: 1 of them
