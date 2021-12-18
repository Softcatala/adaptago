package adapter

import (
	"github.com/leonelquinteros/gotext"
	"github.com/rwtodd/Go.Sed/sed"
	"os"
)

type Valencianitzador struct {
	e *sed.Engine
}

func NewValencianitzador(f string) (*Valencianitzador, error) {
	r, err := os.Open(f)

	if err != nil {
		return nil, err
	}

	e, err := sed.New(r)

	if err != nil {
		return nil, err
	} else {
		return &Valencianitzador{e}, nil
	}
}

func (v *Valencianitzador) AdaptPo(po *gotext.Po) (*gotext.Po, error) {

	t, err := po.MarshalText()

	if err != nil {
		return nil, err
	}

	output, err := v.e.RunString(string(t))

	if err != nil {
		return nil, err
	}

	o := gotext.NewPo()
	o.Parse([]byte(output))

	return o, nil
}
