import got from 'got'
import jsdom from 'jsdom'
const { JSDOM } = jsdom

const parseFngFromHtml = html =>  {
	const { window } = new JSDOM(html)
	const recentFng = window.document.querySelector('.fng-secondary')
	const date = new Date(recentFng.querySelector('.fng-footer').textContent.split(': ')[1])
	date.setMinutes(-date.getTimezoneOffset())
	const timestamp = date.toISOString()
	const value = Number(recentFng.querySelector('.fng-value .fng-circle').textContent)
	return {
		timestamp,
		value
	}
}

const scrapeFngValue = () => got(`https://alternative.me/crypto/fear-and-greed-index/`)
	.then(({ body }) => parseFngFromHtml(body))

export default scrapeFngValue
