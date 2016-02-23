class SendMessageHandler
  constructor: ({@jobManager,@auth,@requestQueue,@responseQueue}) ->

  do: (data, callback=->) =>
    request =
      metadata:
        jobType: 'SendMessage'
        auth: @auth
      data: data

    @jobManager.do @requestQueue, @responseQueue, request, (error) =>
      callback error # no response frame

module.exports = SendMessageHandler