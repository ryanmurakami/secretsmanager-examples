const AWS = require('aws-sdk')

AWS.config.update({ region: 'us-west-2' })

const sm = new AWS.SecretsManager()

async function retrieveSecret (key) {
  const params = {
    SecretId: key
  }

  try {
    const secret = await sm.getSecretValue(params).promise()
    console.log(secret)
  } catch (err) {
    console.error('Could not retrieve secret', err)
  }
}

if (process.argv.length < 3) {
  console.log('Please provide a secret key')
  process.exit(0)
}

const keyArg = process.argv[2]
retrieveSecret(keyArg)