/* 
 * Paste this inside your browser!
 * It downloads all pdfs
 */
async function downloadFiles() {
    let downloadLinks = [];

    document.querySelectorAll(".aalink").forEach((elem) => {
        if (elem.querySelector("img[src='https://www.moodle.aau.dk/theme/image.php/boost/core/1683559133/f/pdf-24']") != null) {
            let link = document.createElement('a');
            link.href = elem.getAttribute("href");
            link.download = elem.textContent;
            downloadLinks.push(link);
        }
    });

    for (let link of downloadLinks) {
        document.body.appendChild(link);
        link.click();
        await new Promise(resolve => setTimeout(resolve, 1000));
        document.body.removeChild(link);
    }
}

downloadFiles();