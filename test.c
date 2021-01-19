int i = 1;
void increment(void) {
	i++;
	return;
}

int main() {
	increment();
	i++;
	return i;
}
