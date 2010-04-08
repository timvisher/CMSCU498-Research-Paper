file = new File(args[0] + '.csv')

while (200 >= file.size() / 1000) {
    def random = Math.random()
    if (0.5 >= Math.random()) {
        random *= -1
    }
    file.append(random+'\n')
}
