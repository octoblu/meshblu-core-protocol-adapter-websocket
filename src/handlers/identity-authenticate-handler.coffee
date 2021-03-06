class IdentityAuthenticateHandler
  constructor: ({@jobManager,@auth,@requestQueue,@responseQueue}) ->

  do: (data, callback=->) =>
    {uuid, token} = data
    return callback null, 'identify', metadata: {code: 204} unless uuid? && token?

    request =
      metadata:
        jobType: 'Authenticate'
        auth:
          uuid: uuid
          token: token

    @jobManager.do request, (error, response) =>
      return callback error, 'identify' if error?
      callback null, 'identity', response

module.exports = IdentityAuthenticateHandler
