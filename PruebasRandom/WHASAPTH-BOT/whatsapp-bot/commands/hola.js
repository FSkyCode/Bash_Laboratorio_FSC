module.exports = {
    name: "hola",

    async execute(sock, from, args, msg) {

        await sock.sendMessage(from, {
            text: "👋 Hola humano"
        })

    }
}
