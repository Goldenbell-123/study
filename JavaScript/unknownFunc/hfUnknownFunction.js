// 익명의 함수로 바꿔보세요.
function vaccine(dosage) {
    if (dosage > 0) {
        inject(dosage);
    }
}

adminster(patient, vaccine, time);

////////////////////////////////////////////////

adminster(patient, function(dsage) {
    if (dosage > 0) {
        inject(dosage);
    }
}, time);
