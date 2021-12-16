package adapter

type sedRunner interface {
	run(i string) (string, error)
}
