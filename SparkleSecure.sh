#! /usr/bin/bash

# https://github.com/diplomendstadium/sparklesecure/

# Start
echo
echo '  ,=\.-----""""^==-- '
echo ' ;;`( ,___, ,/~\;    '
echo ' `  )/>/   \|-,      '
echo '    | `\    | "      '
echo '    "   "   "        '
echo '  SparkleSecure v1   '
echo


# Abfrage relevanter Variablen

# $eingabe String, der Ver- oder Entschlüsselt werden soll
echo 'Die Zeichenfolge eingeben, die Ver- oder Entschlüsselt werden soll:'
read eingabe
echo

# $userpw Passwort zum Ver- und Entschlüsseln der Daten
echo 'Bitte das Passwort eingeben, das verwendet werden soll:'
read -s userpw
echo

# $modus Verschlüsselung oder Entschlüsselung
echo 'Bitte e für Verschlüsselung oder d für Entschlüsselung eingeben:'
read modus
echo

# Passwort aufbereiten
hashpw=$userpw
for i in {1..777};
  do
    hashpw=$(echo -n $hashpw | /usr/bin/sha512sum | cut -d " " -f1)
done

# Passwort anzeigen
echo
echo 'Es wird mit folgendem errechneten Passwort gearbeitet:'
echo $hashpw
echo


# Infoblock
if [ "$modus" = "e" ]; then
    echo 'Hier das errechnete Chiffrat:'
elif [ "$modus" = "d" ]; then
    echo 'Hier der errechnete Klartext:'
else

    echo 'Hier stimmt irgendwas nicht...'
    echo 'Programm wird beendet.'
    echo
    exit 1
fi

# Crypto
output=$(echo $eingabe | openssl enc -$modus -aes-256-cbc -salt -a -md sha512 -pbkdf2 -k $hashpw)

# Ausgabe der Crypto
echo
echo '##############################'
echo $output
echo '##############################'

# Programmende
echo
echo 'Fertig. Programm wird beendet.'
echo
