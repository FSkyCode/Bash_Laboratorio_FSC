historia=(
"¿Estás listo?"

"Todo inicia con un niño..."

"Era igual que los demás, igual de inteligente, constructivo y responsable..."

"Pero..."

"No de corazón."
"Era único, especial y muy sensible, pero no era malo..."

"Ese corazón tan especial se sentía solo..."
"Sin nadie con quien hablar o ser él mismo."

"Durante un tiempo fue así..."

"Hasta que llegó alguien..."

"Un niño más extrovertido, más loco y entusiasta que otros..."
"Podía hablar hasta por las orejas (y a veces lo hacía)."

"Pero también sabía escuchar."

"Sabía estar en el momento correcto..."
"O simplemente estaba ahí."

"Ese niño estuvo con nuestro protagonista."

"Así comenzó una amistad hermosa, irrompible y muy especial."
)

indice=0

while true; do
  clear
  echo ""
  echo -e "${historia[$indice]}"
  
  echo ""
  echo "[Enter] Seguir | [1] Regresar | [2] Salir"
  read -r op

  case "$op" in
    "")
      ((indice++))
      ;;
    1)
      ((indice--))
      ;;
    2)
      echo "Has salido de la historia."
      break
      ;;
    *)
      echo "Opción inválida"
      sleep 1
      ;;
  esac

  # límites
  if ((indice < 0)); then
    indice=0
  fi

  if ((indice >= ${#historia[@]})); then
    echo ""
    echo "Fin de la historia, pero no es el fin de tu historia =D."
    break
  fi
done
