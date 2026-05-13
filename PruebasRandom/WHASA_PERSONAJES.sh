whasa_personajes() {
  source WHASA_PERSONAJES.sh
  sleep 1
  terminal_personaje
}

terminal_personaje() {
  echo "BIENVENIDO!"
  help
  sleep 1
  echo ""
  echo "DATOS CURIOSOS:"
  echo "1. Todo se limpiara para facilitar una visualizacion rapida de lo importante, la plantilla!"
  echo ""
  echo "Escoge un personaje para rolear!"
  read -p "> " personajeEscogido

  case "$personajeEscogido" in
    chara) clear ; sleep 1; CHARA ;;
    belle) clear ; sleep 1; BELLE ;;
    *) clear; sleep 1; help ;;
  esac
}

help() {
  echo "Solo esta disponible 'chara', intenta con ella!"
}

# PERSONAJES

CHARA() {
  limite="+--------------------------------------+"
  separador="|--------------------------------------|"

  echo "$limite"
  printf "| %-36s \n" "COMUNIDAD: Deltaminación!"
  echo "$separador"

  printf "| %-36s \n" "PERSONAJE INFO"
  echo "$separador"

  printf "| %-36s \n" "PERSONAJE: Chara"
  printf "| %-36s \n" "ORIGEN: Undertale (fanon 50%, canon 50%)"
  echo "$separador"

  printf "| %-36s \n" "REAL INFO (NO IMPORTANTE)"
  echo "$separador"

  printf "| %-36s \n" "Nombre/Apodo: Juan"
  printf "| %-36s \n" "Edad: 16"

  echo "$limite"
}

BELLE() {
  limite="+--------------------------------------+"
  separador="|--------------------------------------|"

  echo "$limite"
  printf "| %-36s \n" "COMUNIDAD: 'Ninguna'"
  echo "$separador"

  printf "| %-36s \n" "PERSONAJE INFO"
  echo "$separador"

  printf "| %-36s \n" "PERSONAJE: Belle"
  printf "| %-36s \n" "ORIGEN: Sonic comics Archie"
  echo "$separador"

  printf "| %-36s \n" "REAL INFO (NO IMPORTANTE)"
  echo "$separador"

  printf "| %-36s \n" "Nombre/Apodo: Juan"
  printf "| %-36s \n" "Edad: 16"

  echo "$limite"
}
