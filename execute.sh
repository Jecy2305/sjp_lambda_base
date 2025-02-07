## CREACIÓN DEL STACK
#aws cloudformation create-stack --stack-name stack-gbzapp001sjp --template-body file://soap-api.yaml --capabilities CAPABILITY_NAMED_IAM --profile petpal_dev

## ACTUALIZACIÓN DEL STACK
#aws cloudformation update-stack --stack-name stack-gbzapp001sjp --template-body file://soap-api.yaml --capabilities CAPABILITY_NAMED_IAM --profile petpal_dev


#!/bin/bash

# Carpeta donde se encuentra el código fuente
SOURCE_FOLDER="./src"

# Nombre del archivo principal (handler)
HANDLER_FILE="index.js"

# Nombre de la función AWS Lambda
LAMBDA_FUNCTION_NAME="stack-gbzapp001sjp-gbzapp001sjp-QrotaPioDMk1"

# Perfil de AWS CLI
AWS_PROFILE="petpal_dev"

# Empaquetar el contenido de la carpeta src en un archivo ZIP
zip -r $LAMBDA_FUNCTION_NAME.zip $SOURCE_FOLDER/*  node_modules/* package.json index.js

# Crear la función en AWS Lambda
#'''
#aws lambda create-function \
#    --function-name $LAMBDA_FUNCTION_NAME \
#    --runtime nodejs14.x \
#    --handler $HANDLER_FILE.handler \
#    --zip-file fileb://$LAMBDA_FUNCTION_NAME.zip \
#    --role arn:aws:iam::418334950001:role/bbc-lambda-role \
#    --profile $AWS_PROFILE
#'''
# Actualizar la función en AWS Lambda (si ya existe)
 aws lambda update-function-code \
     --function-name $LAMBDA_FUNCTION_NAME \
     --zip-file fileb://$LAMBDA_FUNCTION_NAME.zip \
     --profile $AWS_PROFILE

# Limpiar archivos temporales
rm $LAMBDA_FUNCTION_NAME.zip
