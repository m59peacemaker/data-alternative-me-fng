#!/bin/sh
":" //# http://sambal.org/?p=1014 ; exec /usr/bin/env node --experimental-modules "$0" "$@"

import R from 'ramda'
import store from './store'
import scrapeFngValue from './scrape-fng-value'

const timestampOfLast = R.compose(R.prop('timestamp'), R.last)

Promise.all([
	store.get(),
	scrapeFngValue()
])
	.then(([ storedRecords, latestRecord ]) => {
		console.log(timestampOfLast(storedRecords), R.prop('timestamp', latestRecord))
		const storeIsStale = timestampOfLast(storedRecords) !== R.prop('timestamp', latestRecord)
		return storeIsStale
		  ? store.append(latestRecord)
				.then(() => console.log(`FnG data updated.\n${JSON.stringify(latestRecord)}`))
			: console.log('FnG data is already up-to-date')
	})
