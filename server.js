import ronin from 'ronin-server'
import mocks from 'ronin-mocks'

const server = ronin.server()

server.use('/foo', (req, res) => {
  return res.json({foo: 'bar'})
})

server.use('/', mocks.server(server.Router(), false, true))
server.start()
