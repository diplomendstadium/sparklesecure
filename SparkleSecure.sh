#! /usr/bin/bash

# https://github.com/diplomendstadium/sparklesecure/

# Start
echo
echo '  ,=\.-----""""^==-- '
echo ' ;;`( ,___, ,/~\;    '
echo ' `  )/>/   \|-,      '
echo '    | `\    | "      '
echo '    "   "   "        '
echo '  SparkleSecure v1.2 '
echo


# ---------------------------
# Abfrage relevanter Variablen
# ---------------------------

# $eingabe: Nachricht, die ver- oder entschlüsselt werden soll
echo 'Die Zeichenfolge eingeben, die Ver- oder Entschlüsselt werden soll:'
read eingabe
echo

# $userpw: Abfrage des Passworts
read -s -p 'Passwort:' userpw
echo

# $modus: Verschlüsselung oder Entschlüsselung festlegen
echo
read -p 'e für Verschlüsselung, d für Entschlüsselung: ' modus
echo

# Falls verschlüsselt wird, Abfrage von Absender und Empfänger
if [ "$modus" = "e" ]; then
    # $sender Absender
    read -p 'Von wem stammt diese Nachricht?: ' sender
    echo

    # $receiver Empfänger
    read -p 'Für wen ist diese Nachricht?: ' receiver
    echo
fi

# 777x aus dem Passwort einen Hash berechnen, daraus einen Hash, etc. um
# Brute-Force Angriffe schwerer zu machen, die einfache Passwörter raten
hashpw=$userpw
for i in {1..777};
  do
    hashpw=$(echo -n $hashpw | /usr/bin/sha512sum | cut -d " " -f1)
done

# ---------------------------
# Ab hier dann das eigentliche Programm
# ---------------------------

# Infoblock...
# ... für Verschlüsselung
if [ "$modus" = "e" ]; then
    echo 'Hier das errechnete Chiffrat:'
# ... für Entschlüsselung
elif [ "$modus" = "d" ]; then
    echo 'Hier der errechnete Klartext:'
# ... bei Fehlern
else
    echo 'Hier stimmt irgendwas nicht...'
    echo 'Programm wird beendet.'
    echo
    exit 1
fi

# Hier passiert jetzt die eigentliche Ver- bzw. Entschlüsselung
if [ "$modus" = "e" ]; then
    output=$(echo $eingabe | openssl enc -aes-256-cbc -salt -a -md sha512 -pbkdf2 -iter 4321 -k $hashpw)
else
    output=$(echo $eingabe | openssl enc -d -aes-256-cbc -salt -a -md sha512 -pbkdf2 -iter 4321 -k $hashpw)
fi


# Ausgabe des Ergebnisses
echo
echo '##############################'
echo
# Anzeigen von Sender, Absender und eines Zeitstempels, falls wir gerde verschlüsseln
if [ "$modus" = "e" ]; then
    echo "Von: $sender | An: $receiver | $(date +%F_%R)"
fi
echo $output
echo
echo '##############################'

# Programmende
echo
echo 'Fertig. Programm wird beendet.'
echo
