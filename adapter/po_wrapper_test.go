package adapter

import (
	"github.com/softcatala/adaptago/projectpath"
	"path/filepath"
	"testing"
)

func Test_getPoFile(t *testing.T) {

	templatePoFile := filepath.Join(projectpath.Root, "./res/template.po")

	tests := []struct {
		name    string
		po      string
		wantErr bool
	}{{
		"Fails when loading non-existing file",
		"./tests/non-existing.po",
		true,
	}, {
		"Fails when loading invalid file",
		"./tests/invalid.po",
		true,
	}, {
		"Processes valid file",
		templatePoFile,
		false,
	}}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got, err := getPoFile(tt.po)
			if (err != nil) != tt.wantErr {
				t.Errorf("getPoFile() error = %v, wantErr %v", err, tt.wantErr)
				return
			}

			if err == nil {
				if got.Get("Exit") != "Sortida" {
					t.Errorf("getPoFile() Exit = %v", got.Get("Exit"))
				}
			}
		})
	}
}

func Test_poWrapperRunner_run(t *testing.T) {

	sed2valencia := filepath.Join(projectpath.Root, "./tests/src2valencia.sed")
	templatePoFile := filepath.Join(projectpath.Root, "./res/template.po")

	r, err := NewPoFileRunner(sed2valencia, templatePoFile)

	if err != nil {
		t.Errorf("cannot load %v (%v)", sed2valencia, err)
		return
	}

	tests := []struct {
		name    string
		in      string
		out     string
		wantErr bool
	}{{
		"No canvia textos invariants",
		"Taula",
		"Taula",
		false,
	},
		{
			"Canvia textos invariants",
			"Surt",
			"Ix",
			false,
		}}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {

			got, err := r.run(tt.in)
			if (err != nil) != tt.wantErr {
				t.Errorf("run() error = %v, wantErr %v", err, tt.wantErr)
				return
			}
			if got != tt.out {
				t.Errorf("run() got = %v, want %v", got, tt.out)
			}
		})
	}
}
