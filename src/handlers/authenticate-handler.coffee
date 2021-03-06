class AuthenticateHandler
  constructor: ({@jobManager,@auth,@requestQueue,@responseQueue}) ->

  do: (request, callback) =>
    {uuid, token} = request.metadata
    return callback null, 'authenticate', metadata: {code: 204} unless uuid? && token?

    authenticateRequest =
      metadata:
        jobType: 'Authenticate'
        auth:
          uuid: uuid
          token: token

    @jobManager.do authenticateRequest, (error, response) =>
      return callback error, 'authenticate' if error?
      callback null, 'authenticate', response

module.exports = AuthenticateHandler
