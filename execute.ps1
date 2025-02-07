# Carpeta donde se encuentra el código fuente
$SOURCE_FOLDER = ".\src"
# Nombre del archivo principal (handler)
$HANDLER_FILE = "index.js"
# Nombre de la función AWS Lambda
$LAMBDA_FUNCTION_NAME = "stack-gbzapp001sjp-gbzapp001sjp-6C6KRD7hPPBz"
# Perfil de AWS CLI
$AWS_PROFILE = "petpal_dev"

# Empaquetar el contenido de la carpeta src en un archivo ZIP
Compress-Archive -Path "$SOURCE_FOLDER", "node_modules", "package.json", $HANDLER_FILE -DestinationPath "$LAMBDA_FUNCTION_NAME.zip"

# Actualizar la función en AWS Lambda (si ya existe)
aws lambda update-function-code `
    --function-name $LAMBDA_FUNCTION_NAME `
    --zip-file fileb://$LAMBDA_FUNCTION_NAME.zip `
    --profile $AWS_PROFILE

# Limpiar archivos temporales
Remove-Item "$LAMBDA_FUNCTION_NAME.zip"