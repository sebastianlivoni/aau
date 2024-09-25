import net from 'net';

const client = new net.Socket();

client.connect(5968, '127.0.0.1', () => {
    console.log('Connected to server');
    
    // Send a message to the server
    client.write('Hello from the client!');
});

client.on('data', (data) => {
    console.log(data.toString());
});

// Handle the connection closing
client.on('close', () => {
    console.log('Connection closed');
});

// Handle any errors
client.on('error', (err) => {
    console.error('Connection error:', err.message);
});