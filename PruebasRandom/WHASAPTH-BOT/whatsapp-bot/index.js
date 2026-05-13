const fs = require("fs")

const {
    default: makeWASocket,
    useMultiFileAuthState
} = require("@whiskeysockets/baileys")

const P = require("pino")

// CAMBIAR ESTO
const QRCode = require("qrcode")

const commands = {}

const commandFiles = fs.readdirSync("./commands")

for (const file of commandFiles) {

    const command = require(`./commands/${file}`)

    commands[command.name] = command
}

console.log("Comandos cargados:")
console.log(commands)

async function startBot() {

    const { state, saveCreds } =
        await useMultiFileAuthState("session")

    const sock = makeWASocket({
        auth: state,
        logger: P({ level: "silent" })
    })

    sock.ev.on("connection.update", async (update) => {

        const { connection, qr } = update

        // CAMBIAR TODO ESTE BLOQUE
        if (qr) {

            const path =
                "/data/data/com.termux/files/home/storage/downloads/qr.png"

            try {

                await QRCode.toFile(path, qr, {
                    width: 400
                })

                console.log("✅ QR guardado en Downloads")

            } catch (err) {

                console.log("❌ Error QR:", err)
            }
        }

        if (connection === "open") {
            console.log("✅ BOT CONECTADO")
        }
    })

    sock.ev.on("creds.update", saveCreds)

    sock.ev.on("messages.upsert", async ({ messages }) => {

        const msg = messages[0]

        if (!msg.message) return

        const text =
            msg.message.conversation ||
            msg.message.extendedTextMessage?.text

        if (!text) return

        const from = msg.key.remoteJid

        console.log("Mensaje:", text)

        const prefix = "."

        if (!text.startsWith(prefix)) return

        if (msg.key.fromMe) return

        const args =
            text.slice(prefix.length).trim().split(/ +/)

        const commandName =
            args.shift().toLowerCase()

        const command = commands[commandName]

        if (!command) return

        try {

            await command.execute(
                sock,
                from,
                args,
                msg
            )

        } catch (err) {

            console.log(err)
        }
    })
}

startBot()
