// 81 - ціле число, що задає довжину фільтра.
// [0 .1;.12 .4;.42 .5] - матриця розміром Mx2, що визначає границі для кожної зі смуг пропускання фільтра.
// [1 0 1] - вектор довжиною M, який задає бажане значення для кожної смуги частот.
// [1 .5 1] - вектор, довжиною M, який задає допустиму величину похибки для кожної смуги частот.

hn=eqfir(81,[0 .1;.12 .4;.42 .5],[1 0 1],[1 .5 1]);

[hm,fr]=frmag(hn,256);

plot2d(fr,20*log10(hm))

xtitle('High Pass filter using eqfir','freq (Hz)', 'Amplitude (dB)')

