import net from "net"
import fs from "node:fs"

// This server listens on TCP/IP port 1234
const server = net.createServer((client) => {
    client.on('data', (data) => {
        // console.log('Received from client:', data.toString());
        const fileData = fs.readFileSync('./index.html', 'utf8');
        client.write(fileData);
    });

    client.on('end', () => {
        console.log('Client disconnected');
    });
});

server.listen(5968);