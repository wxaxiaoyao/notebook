function parse(text) {
	var result = "";
	var index = 0;
	while (text[index] != '{' && index < text.length) {
		index++;
	}
	while (index < text.length) {
		while (text[index] == ' ' || text[index] == '\t' || text[index] == '\r' || text[index] == '\n') {
			index++
			if (index >= text.length) {
				return result;
			}
		}
		// È¥key×ó²à¿Õ°×
		do {
			if (result.length > 0  && result[result.length-1] == ',' && text[index] == '}') {
				result = result.substr(0, result.length-1);
			}

			result += text[index];  // { , }
			index++;
			if (index >= text.length) {
				return result;
			}

			while (text[index] == ' ' || text[index] == '\t' || text[index] == '\r' || text[index] == '\n') { // È¥key×ó²à¿Õ°×
				index++
				if (index >= text.length) {
					return result;
				}
			}
		} while (text[index] == '}' || text[index] == ',');


		result += '"'; // key ×ó "
		while (text[index] != ' ' && text[index] != '\t' && text[index] != '\r' && text[index] != '\n' && text[index] != '=') {
			result += text[index];  // key
			index++;
			if (index >= text.length) {
				return result;
			}
		}
		result += '"'; // key ÓÒ "
		// È¥=×ó²à¿Õ°×
		while (text[index] == ' ' || text[index] == '\t' || text[index] == '\r' || text[index] == '\n') {
			index++;
			if (index >= text.length) {
				return result;
			}
		}
		if (text[index] == '=') {
			result += ':';
			index++;
		} else {
			console.log("Êý¾Ý¸ñÊ½´íÎó");
			//return;
		}
		// È¥value×ó²à¿Õ°×
		while (text[index] == ' ' || text[index] == '\t' || text[index] == '\r' || text[index] == '\n') {
			index++
			if (index >= text.length) {
				return result;
			}
			;
		}

		if (text[index] >= '0' && text[index] <= '9') { // value = number
			while (text[index] >= '0' && text[index] <= '9') {
				result += text[index];  // value
				index++;
			}
		} else if (text[index] == '"' || text[index] == "'") {   // value = string
			strFlag = text[index];
			result += text[index];
			index++;
			while (!(text[index - 1] != '\\' && text[index] == strFlag)) {
				result += text[index];
				index++;
				if (index >= text.length) {
					return result;
				}
			}
			result += text[index];
			index++;
		} else {                                        // string = object
			continue;
		}
	}
	return result;
}