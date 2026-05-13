module.exports = {
    name: "ping",

    async execute(sock, from, args, msg) {

        await sock.sendMessage(from, {
            text: "pong 🏓"
        })

    }
}
