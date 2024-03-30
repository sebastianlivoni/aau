let totalEcts = 0;
let sumKarakter = 0;

const fag = document.querySelectorAll(".DataSelect");

fag.forEach((elem) => {
  const karakter = parseFloat(elem.children[2].textContent);
  const ects = parseFloat(elem.children[4].textContent);

  if (!isNaN(karakter)) {
    sumKarakter += karakter * ects;
    totalEcts += ects;
    console.log(totalEcts, karakter, ects);
  }
});

const gennemsnit = sumKarakter / totalEcts;

const table = document.getElementById("resultTable");
const tbody = table.getElementsByTagName("tbody")[0];

const newRowHTML = `
  <tr class="DataSelect" title="Detaljer for resultatet">
    <td class="DataValue" valign="top"> <strong>Weighted Average:</strong></td>
    <td class="DataValue" align="center" valign="top"></td>
    <td class="DataValue" valign="top" align="center"></td>
    <td class="DataValue" align="center" valign="top"></td>
    <td class="DataValue" align="right" valign="top"><strong>${gennemsnit.toFixed(1)}&nbsp;&nbsp;</strong></td>
  </tr>
`;

tbody.innerHTML += newRowHTML;
