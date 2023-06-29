# script para llamar metodos de la API de github
# usa autenticacion.

REPO_OWNER=""
REPO_NAME=""
TOKEN=""
# Direccion del recurso de la API
API_URL="https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/collaborators"

RESPONSE=$(curl -s -H "Authorization: Bearer $TOKEN" "$API_URL")

if [[ "$RESPONSE" == *"Bad credentials"* ]]; then
    echo "Error: Token invalido"
    exit 1
fi

USERNAMES=$(echo "$RESPONSE" | jq -r '.[].login')

# Imprimir los nombres de usuario
echo "Usuarios del repositorio $REPO_OWNER/$REPO_NAME:"
for username in $USERNAMES; do
  echo "- $username"
done