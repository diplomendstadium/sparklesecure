# SparkleSecure
Einfache Textverschlüsselung auf dem Linux-Terminal

Heutzutage stehen uns viele vermeintlich sichere und benutzerfreundliche Verschlüsselungslösungen zur Verfügung. Von Cryptomator für Daten bis hin zu Signal für die Kommunikation. Auf den zweiten Blick haben viele dieser Lösungen jedoch einen faden Beigeschmack. Sie sind so komplex, dass ehrlich gesagt die meisten von uns nicht in der Lage sind, den Quellcode auch nur annähernd zu verstehen. Das ist unbefriedigend. Auch sind viele weit verbreiteten Lösungen wie z.B. Threema so groß, dass sie immer als Organisation mit festen Mitarbeiter:innen durch nationales (Überwachungs-)Recht in ihren Heimatländern greifbar sind.

Für die wenigen Dinge im Alltag, bei denen es wirklich auf Vertraulichkeit ankommt, habe ich daher SparkleSecure geschrieben. Das Programm ist ein so einfaches Skript, dass wirklich jeder mit grundlegenden Bash-Kenntnissen verstehen kann, was hier passiert. Außerdem verwendet das Skript nur grundlegende Befehle, die auf jedem Linux vorhanden sein sollten, und benötigt daher keine Installation. Aufgrund seiner Struktur eignet sich das Programm vor allem für kurze Textnachrichten - durch kleine Änderungen am Quelltext lassen sich aber auch z.B. Dateien verschlüsseln.

Einfach die Datei [SecureSparkle.sh](https://github.com/diplomendstadium/sparklesecure/blob/main/SparkleSecure.sh) herunterladen, den Ordner im Terminal öffnen und mit `bash SparkleSecure.sh` loslegen.

Die verschlüsselte Nachricht kann dann auf beliebige Weise versendet werden - der Inhalt ist ja gut geschützt :-)

# SparkleSecure
Simple text encryption on the Linux terminal

Nowadays, there are many supposedly secure and user-friendly encryption solutions available to us. From Cryptomator for data to Signal for communication. At second glance, however, many of these solutions have a bland flavour. They are so complex that, to be honest, most of us are unable to even begin to understand the source code. This is unsatisfactory. Also, many widely used solutions such as Threema are so large that they are always tangible as an organisation with permanent employees due to national (surveillance) law in their home countries.

I have therefore written SparkleSecure for the few things in everyday life where confidentiality is really important. The programme is such a simple script that anyone with a basic knowledge of Bash can understand what is happening here. In addition, the script only uses basic commands that should be available on every Linux system and therefore requires no installation. Due to its structure, the programme is particularly suitable for short text messages - but small changes to the source code can also be used to encrypt files, for example.

Simply download the file [SecureSparkle.sh](https://github.com/diplomendstadium/sparklesecure/blob/main/SparkleSecure.sh), open the folder in the terminal and get started with `bash SparkleSecure.sh`.

The encrypted message can then be sent in any way you like - the content is well protected :-)
