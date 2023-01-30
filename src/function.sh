SECRET_STRING=$(aws secretsmanager get-secret-value --secret-id "$SECRETS_NAME" --region ap-northeast-1 --query 'SecretString' --output text)

DB_HOST=$(echo "$SECRET_STRING" | jq -r '."db-host"')
DB_NAME=$(echo "$SECRET_STRING" | jq -r '."db-name"')
DB_USER=$(echo "$SECRET_STRING" | jq -r '."db-user"')
DB_PASS=$(echo "$SECRET_STRING" | jq -r '."db-password"')

function handler() {
  filename=$(date '+%Y-%m-%d_%H%M%S').sql.gz

  mysqldump --no-tablespaces -u "$DB_USER" -p"$DB_PASS" -h "$DB_HOST" "$DB_NAME" users | \
      gzip | \
      aws s3 cp - s3://"$S3_BUCKET_NAME"/backup/"$filename"

  echo "$filename"
}
