/* 
 * Paste this inside your browser!
 * It downloads all pdfs
 */
let points = 0, totals = 0;
document.querySelectorAll(".grade").forEach((elem) => {
    let [point, k1, k2, k3, total] = elem.textContent.split(" ")
    if (point == "Vægter") return;
    console.log(point, k1, k2)
    points += parseFloat(point);
    totals += parseFloat(total);
})
let percentage = Math.round(points / totals * 100 * 100) / 100;
console.log(`Scored ${points} points out of ${totals} => ${percentage}%`);