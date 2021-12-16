package adapter

import (
	"github.com/rwtodd/Go.Sed/sed"
	"strings"
)

type sedRunner interface {
	run(i string) (string, error)
}

type stringRunner struct {
	e *sed.Engine
}

func NewStringRunner(r string) (sedRunner, error) {
	e, err := sed.New(strings.NewReader(r))

	if err != nil {
		return nil, err
	} else {
		return &stringRunner{e}, nil
	}
}

func (s *stringRunner) run(i string) (string, error) {
	o, err := s.e.RunString(i)

	if err != nil {
		return "", err
	}

	return strings.TrimRight(o, "\n"), nil
}
